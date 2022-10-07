'use strict';

const path = require('path');

module.exports = appInfo => {

  return {
    appDirectoryLink: 'http://127.0.0.1:7007/directory',
    static: {
      maxAge: 0,
      buffer: false,
      preload: false,
      maxFiles: 0,
    },
    logger: {
      outputJSON: true,
      consoleLevel: 'DEBUG',
      level: 'DEBUG',
      dir: path.join(appInfo.baseDir, 'logs'),
      contextFormatter(meta) {
        return `[${meta.date}] [${meta.level}] [${meta.ctx.method} ${meta.ctx.url}] ${meta.message}`;
      }
    },
    knex: {
      client: {
        dialect: 'mysql',
        connection: {
          host: '103.245.93.18',
          port: 33067,
          user: 'root',
          password: 'c7d9bd8d1ac97874',
          database: 'jianghujs_enterprise_demo_xiaoapp'
        },
        pool: { min: 0, max: 100 },
        acquireConnectionTimeout: 30000
      },
      app: true
    }
  };

};
