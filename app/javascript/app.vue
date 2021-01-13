<template>
  <div id="app">
    <Players v-if="false"></Players>
    <Teams v-else></Teams>
  </div>
</template>

<script>
import Players from './components/players'
import Teams from './components/teams'

export default {
  components: {
    Players,
    Teams
  },

  data: function () {
    return {
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
