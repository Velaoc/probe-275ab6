# A single anonymous entry on the guestbook wall. No account, no identity
# beyond the optional name the visitor chooses to leave.
class GuestbookMessage < ApplicationRecord
  ANONYMOUS_AUTHOR = "Anonymous"

  MAX_BODY_LENGTH = 500
  MAX_NAME_LENGTH = 80

  validates :body, presence: true, length: { maximum: MAX_BODY_LENGTH }
  validates :name, length: { maximum: MAX_NAME_LENGTH }

  scope :newest_first, -> { order(created_at: :desc, id: :desc) }

  before_validation :normalize_fields

  # The name shown on the wall: the visitor's own, or the friendly default.
  def author
    name.presence || ANONYMOUS_AUTHOR
  end

  private

  def normalize_fields
    self.name = name.to_s.strip.presence
    self.body = body.to_s.strip
  end
end
