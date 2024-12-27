require('dotenv').config()

module.exports = ({ env }) => ({
  host: env('HOST', process.env.HOST),
  port: env.int('PORT', process.env.PORT),
  admin: {
    auth: {
      secret: env('ADMIN_JWT_SECRET', 'b8e79284b1040641365646ec36a209a8'),
    },
  },
});