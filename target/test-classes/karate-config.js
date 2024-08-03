function fn() {
    var config = {
        author: 'Tony Thongsinthop',
        baseUrl: 'https://petstore3.swagger.io/api/v3/',
        apiToken: '1283c7a2b9f39fcd6aac40bbae5b38db2f6c8e3743c4c9ce73f0e3e0ffd1e9e1',
        contentType: 'application/json'
    };

    var env = karate.env;
    karate.log('Given: ', env);
    if (env == 'dev') {
        config.baseUrl = 'https://petstore3.swagger.io/api/v3/'
    } else if (env == 'prod') {
        config.baseUrl = 'https://petstore3.swagger.io/api/v3/'
    } else if (env == 'local') {
        config.baseUrl = 'https://petstore3.swagger.io/api/v3/'
    }

    karate.configure('connectTimeout', 5000);
    karate.configure('readTimeout', 5000);
    return config;
}