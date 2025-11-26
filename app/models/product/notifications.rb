module Product::Notifications
    extend ActiveSupport::Concern

    included do
        has_many :subscribers, dependent: :destroy
        after_update_commit :notify_subscribers, if: :back_in_stocks?
    end

    def back_in_stocks?
        Rails.logger.info("check for call back")
        inventory_count_previously_was.zero? && inventory_count.positive?
    end

    def notify_subscribers
        subscribers.each do |subscriber|
            ProductMailer.with(
                product: self,
                subscriber: subscriber
            ).in_stock.deliver_later
        end
    end
end
