class UnsubscribesController < ApplicationController
  allow_unauthenticated_access

  def show
    subscriber&.destroy

    redirect_to root_path, notice: "Unsubscribed successfully"
  end

  private
    def subscriber
      @subscriber ||= Subscriber.find_by_token_for(:unsubscribe, params[:token])
    end
end
