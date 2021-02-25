if Rails.env === 'production'
  Rails.application.config.session_store :cookie_store, key: '_finance_portfolio', domain: 'investment-portfolio.herokuapp.com'
else
  Rails.application.config.session_store :cookie_store, key: '_finance_portfolio'
end