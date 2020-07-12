if (process.env.NODE_ENV === 'production') {
  module.exports = ({ env }) => ({
    upload: {
      provider: 'aws-s3',
      providerOptions: {
        accessKeyId: env('AWS_ACCESS_KEY_ID'),
        secretAccessKey: env('AWS_ACCESS_SECRET'),
        region: 'eu-west-3',
        params: {
          Bucket: 'scb-back-preprod-images',
        },
      },
    },
  });
} else {
  module.exports = {};
}
