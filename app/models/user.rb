class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable

    validates :firstname,presence: {message: " kısmı boş bırakılamaz!"},length: {minimum:3,maximum:50,message: " kısmı en az 3, en fazla 50 karakter alabilir"}
    validates :lastname,presence: {message: " kısmı boş bırakılamaz!"},length: {minimum:3,maximum:75,message: " kısmı en az 3, en fazla 75 karakter alabilir"}
    validates :username,presence: {message: " kısmı boş bırakılamaz!"},length: {minimum:5,maximum:20,message: " kısmı en az 5, en fazla 20 karakter alabilir"},uniqueness: {case_sensitive: false,message:" kısmı kişiye özel olmalıdır"}
    validates :email,presence: {message: " kısmı boş bırakılamaz!"}, uniqueness: {case_sensitive: true,message: " kısmı eşsiz olmalıdır!"},email: {message: " kısmı geçersizdir!"}
    validates :telephone_number,presence: {message: " kısmı boş bırakılamaz!"},length: {is:17,message: " kısmı en az 10 karakter olmalıdır"},uniqueness: {case_sensitive: false,message:" kısmı eşsiz olmalıdır!"}
    validates :password ,presence: {message: " kısmı boş bırakılamaz!"},length: {minimum:6,maximum:129,message: " kısmı en az 6, en fazla 129 karakter alabilir"}, format: {with: /(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}/,message: " kısmınında en az bir büyük,bir küçük, bir sayı ve bir sembol bulunması zorunludur!"}

    # validates_presence_of :firstname,:lastname,:username,:email,:telephone_number,:password

    def self.valid_username?(username)
        if username.blank? || !username.match(/^[A-Za-z\d]*[-_]{0,1}[A-Za-z\d]*[-_]{0,1}[A-Za-z\d]*$/) || username.length < 6
            false
        else
            true
        end
    end
    def self.valid_password?(password)
        password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/) ? true : false
    end
end
