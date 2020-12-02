class User < ApplicationRecord
    before_save {self.email = email.downcase }
    # dependent: :destroy- if user gets deleted all dependent articles will be deleted
    has_many :articles, dependent: :destroy
    validates:username, presence:true,
                        uniqueness: { case_sensitive: false }, 
                        length:{ minimum:3, maximum:25 }
    # All CAPS means constant in Ruby
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates:email, presence:true,
                     uniqueness: { case_sensitive: false }, 
                     length:{ maximum:105 },
                     format:{with:VALID_EMAIL_REGEX }
    has_secure_password
end