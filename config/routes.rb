# Check out https://github.com/joshbuddy/http_router for more information on HttpRouter
HttpRouter.new do
  add('/').to(HomeAction)
  add('/play').to(LearnAction)
  add('/restraunts').to(RestrauntAction)
end
