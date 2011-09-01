class Order < ActiveRecord::Base
  attr_accessor :card_number, :card_verification

  validate_on_create :validate_card

  belongs_to :user

  def purchase
    response = GATEWAY.purchase(price_in_cents, credit_card, purchase_options)
    self.status = "active" if response.success?
    response.success?
    Rails.logger.info response.inspect
  end

  def price_in_cents
    amount.to_f.round
  end

  def create_user
    user = User.new({:first_name => self.first_name, :last_name => self.last_name, :email => self.email, :login => self.login,:password => self.password})
    user.save
    user
   end

  private

  def purchase_options
    {
      :ip => ip_address,
      :billing_address => {
        :name     => "Ryan Bates",
        :address1 => "123 Main St.",
        :city     => "New York",
        :state    => "NY",
        :country  => "US",
        :zip      => "10001"
      }
    }
  end

  def validate_card
    unless credit_card.valid?
      credit_card.errors.full_messages.each do |message|
        errors.add_to_base message
      end
    end
  end

  def credit_card
    @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
      :type               => card_type,
      :number             => card_number,
      :verification_value => card_verification,
      :month              => card_expires_on.month,
      :year               => card_expires_on.year,
      :first_name         => first_name,
      :last_name          => last_name
    )
  end


end
