class Comment < ActiveRecord::Base
  after_create :set_ticket_state

  belongs_to :ticket
  belongs_to :state
  belongs_to :user

  validates :text, :presence => true

  delegate :project, :to => :ticket

  private
  def set_ticket_state
    self.ticket.state = self.state
    self.ticket.save!
  end
end
