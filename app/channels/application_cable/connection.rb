module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user
    def connect
      self.current_user = find_verified_user || User.find_by(auth_type: "visitor")
      logger.add_tags 'ActionCable', current_user.email
    end

    protected

    def find_verified_user
      if verified_user = User.find_by(id: cookies.encrypted[:user_id])
        verified_user
      end
    end
  end
end
