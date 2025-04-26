<template>
  <div>
    <div v-show="loading">Fetching tags...</div>
    <div class="related-tags flex-wrap">
      <div class="related-items" v-for="(sTags, i) in splitTags" :key="i">
        <tag-preview-tag
          v-for="(tag, $idx) in sTags"
          :key="$idx"
          :tag="tag"
        ></tag-preview-tag>
      </div>
    </div>
  </div>
</template>

<script>
import tagPreviewTag from './tag_preview_tag.vue';

export default {
  props: ['tags', 'loading'],
  components: {
    'tag-preview-tag': tagPreviewTag,
  },
  computed: {
    splitTags() {
      const sorted = [...this.tags].sort((a, b) =>
        a.name.localeCompare(b.name)
      );

      const chunkArray = (arr, size) => {
        const chunks = [];
        for (let i = 0; i < arr.length; i += size) {
          chunks.push(arr.slice(i, i + size));
        }
        return chunks;
      };

      return chunkArray(sorted, 15);
    },
  },
};
</script>
