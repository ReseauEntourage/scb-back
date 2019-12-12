'use strict';

/**
 * Entete.js controller
 *
 * @description: A set of functions called "actions" for managing `Entete`.
 */

module.exports = {

  /**
   * Retrieve entete records.
   *
   * @return {Object|Array}
   */

  find: async (ctx, next, { populate } = {}) => {
    if (ctx.query._q) {
      return strapi.services.entete.search(ctx.query);
    } else {
      return strapi.services.entete.fetchAll(ctx.query, populate);
    }
  },

  /**
   * Retrieve a entete record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.entete.fetch(ctx.params);
  },

  /**
   * Count entete records.
   *
   * @return {Number}
   */

  count: async (ctx, next, { populate } = {}) => {
    return strapi.services.entete.count(ctx.query, populate);
  },

  /**
   * Create a/an entete record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.entete.add(ctx.request.body);
  },

  /**
   * Update a/an entete record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.entete.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an entete record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.entete.remove(ctx.params);
  }
};
