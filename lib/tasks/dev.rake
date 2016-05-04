if Rails.env.development? || Rails.env.test?
  require "factory_girl"

  namespace :dev do
    desc "Sample data for local development environment"
    task prime: "db:setup" do
      include FactoryGirl::Syntax::Methods
      setup_users
      user = User.first
      create(:group, user: user)
    end

    def setup_users
      create(:user)
    end
  end
end
