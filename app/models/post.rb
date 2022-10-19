class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

    validate :clickbait_y_title

    ACCEPTED_TITLES = [
        /Won't Believe/i,
        /Secret/i,
        /Top \d/i,
        /Guess/
    ]

    def clickbait_y_title
        if ACCEPTED_TITLES.none? { |words| words.match title }
            errors.add( :title, "Add clickbait words")
        end
    end

end
