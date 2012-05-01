module TwoFactorAuthenticatable
  module Generators
    class TwoFactorAuthenticationGenerator < Rails::Generators::NamedBase
      namespace "two_factor_authentication"

      desc "Add :two_factor_authenticable directive in the given model. Also generate migration for ActiveRecord"

      hook_for :orm

      def inject_two_factor_authentication_content
        path = File.join("app", "models", "#{file_path}.rb")
        inject_into_file(path, "two_factor_authenticatable, :", :after => "devise :") if File.exists?(path)
      end
    end
  end
end
