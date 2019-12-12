'use strict';

/**
 * Texte.js controller
 *
 * @description: A set of functions called "actions" for managing `Texte`.
 */

module.exports = {

  /**
   * Retrieve texte records.
   *
   * @return {Object|Array}
   */

  find: async (ctx, next, { populate } = {}) => {
    if (ctx.query._q) {
      return strapi.services.texte.search(ctx.query);
    } else {
      return strapi.services.texte.fetchAll(ctx.query, populate);
    }
  },

  /**
   * Retrieve a texte record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.texte.fetch(ctx.params);
  },

  /**
   * Count texte records.
   *
   * @return {Number}
   */

  count: async (ctx, next, { populate } = {}) => {
    return strapi.services.texte.count(ctx.query, populate);
  },

  /**
   * Create a/an texte record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.texte.add(ctx.request.body);
  },

  /**
   * Update a/an texte record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.texte.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an texte record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.texte.remove(ctx.params);
  }
};
