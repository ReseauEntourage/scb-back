'use strict';

/**
 * Parcours.js controller
 *
 * @description: A set of functions called "actions" for managing `Parcours`.
 */

module.exports = {

  /**
   * Retrieve parcours records.
   *
   * @return {Object|Array}
   */

  find: async (ctx, next, { populate } = {}) => {
    if (ctx.query._q) {
      return strapi.services.parcours.search(ctx.query);
    } else {
      return strapi.services.parcours.fetchAll(ctx.query, populate);
    }
  },

  /**
   * Retrieve a parcours record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.parcours.fetch(ctx.params);
  },

  /**
   * Count parcours records.
   *
   * @return {Number}
   */

  count: async (ctx, next, { populate } = {}) => {
    return strapi.services.parcours.count(ctx.query, populate);
  },

  /**
   * Create a/an parcours record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.parcours.add(ctx.request.body);
  },

  /**
   * Update a/an parcours record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.parcours.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an parcours record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.parcours.remove(ctx.params);
  }
};
