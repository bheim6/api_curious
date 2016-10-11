Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, "65b6375fff2aaba018b4",
                    "3e5bc2f3c7cf4fb3da307f36985d4ffe656a56a3",
                    scope: "user,repo,gist"
end
