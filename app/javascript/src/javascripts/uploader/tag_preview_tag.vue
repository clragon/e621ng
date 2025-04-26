<template>
  <div class="tag-preview">
    <div class="main-tag">
      <tag-link :name="tag.name" :tagType="tag.category"></tag-link>
      <span v-if="!tag.id" class="invalid">invalid</span>
      <span v-else-if="tag.implied" class="implied">implied</span>
      <span v-else-if="tag.post_count === 0" class="empty">empty</span>
      <span v-else class="post-count">{{ tag.post_count }}</span>
    </div>
  </div>
</template>

<script>
import tagLink from "./tag_link.vue";

export default {
  props: ["tag"],
  components: {
    "tag-link": tagLink,
  },
};
</script>
