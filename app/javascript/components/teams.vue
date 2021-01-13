<template>
  <section class="section" id="teams">
    <div class="container">
      <!-- table controls -->
      <div class="is-clearfix">
        <div class="field has-addons is-pulled-left">
          <div class="control">
            <a class="button is-primary">Filter</a>
          </div>
          <div class="control">
            <!-- <input type="text" class="input is-primary" placeholder="Player" v-model="playerFilter"> -->
          </div>
        </div>

        <div class="field is-horizontal is-pulled-right" v-if="teams.length > 0">
          <a @click="downloadCSV(sort, sortDirection, page, playerFilter)" class="button is-primary">
            <i class="fas fa-download"></i>
            &nbsp;
            CSV
          </a>
        </div>
      </div>

      <br>

      <div v-if="teams.length > 0">

        <!-- table pagination -->
        <!-- <Pagination :current_page="meta.current_page" :pages="meta.total_pages"/> -->

        <!-- table rendering -->
        <div class="table-container">
          <table class="table is-hoverable is-striped is-fullwidth">
            <thead>
              <tr>
                <th>
                  Team
                </th>

                <th>
                  Total Rushing Yards
                </th>

                <th>
                  Longest Yard
                </th>
              </tr>
            </thead>

            <tbody>
              <tr v-for="team in teams" :key="team.team">
                <td>{{ team.team }}</td>
                <td>{{ team.total_rushing_yards }}</td>
                <td>{{ team.longest_rush }}</td>
              </tr>
            </tbody>
          </table>
        </div>

        <!-- <Pagination :current_page="meta.current_page" :pages="meta.total_pages"/> -->
      </div>

      <div v-else>
        <article class="message is-primary">
          <div class="message-body">
            No players
          </div>
        </article>
      </div>
    </div>
  </section>
</template>

<script>
const axios = require('axios')

import Pagination from './pagination'

export default {
  name: 'Teams',

  components: {
    Pagination
  },

  data () {
    return {
      // page: 1,
      // playerFilter: '',
      teams: [],
      // meta: null,
      // sort: 'player',
      // sortDirection: 'ASC'
    }
  },

  // updates the table when these attributes change
  watch: {
    // sort: function (sort) {
    //   this.fetchPlayers(sort, this.sortDirection, this.page, this.playerFilter)
    // },
    //
    // page: function (page) {
    //   this.fetchPlayers(this.sort, this.sortDirection, page, this.playerFilter)
    // },
    //
    // sortDirection: function (sortDirection) {
    //   this.fetchPlayers(this.sort, sortDirection, this.page, this.playerFilter)
    // },
    //
    // playerFilter: function(filter) {
    //   this.fetchPlayers(this.sort, this.sortDirection, this.page, filter)
    // }
  },

  methods: {
    setSort(column) {
      // // toggle direction if clicked again
      // if (this.sort === column) {
      //   this.toggleSortDirection()
      // } else {
      //   // set sorting attribute
      //   this.sort = column
      //   this.sortDirection = 'ASC'
      // }
    },

    isActive(column) {
      // if (column === this.sort) {
      //   return 'is-active'
      // } else {
      //   return ''
      // }
    },

    toggleSortDirection() {
      // if (this.sortDirection === 'ASC') {
      //   this.sortDirection = 'DESC'
      // } else {
      //   this.sortDirection = 'ASC'
      // }
    },

    // fetchTeams(sort, sortDirection, page, filter) {
    fetchTeams() {
      let query
      // if (sort.length > 0) {
      //   query = `/api/v1/teams?sort=${encodeURIComponent(sort)}&sort_direction=${encodeURIComponent(sortDirection)}&page=${encodeURIComponent(page)}&filter=${encodeURIComponent(filter)}`
      // } else {
        query = `/api/v1/teams`
      // }
      axios.get(query)
        .then(response => response.data)
        .then(data => {
          this.teams = data.teams
          // this.meta = data.meta
        })
    },

    downloadCSV(sort, sortDirection, page, filter) {
      let query
      if (sort.length > 0) {
        query = `/api/v1/players.csv?sort=${encodeURIComponent(sort)}&sort_direction=${encodeURIComponent(sortDirection)}&page=${encodeURIComponent(page)}&filter=${encodeURIComponent(filter)}`
      } else {
        query = `/api/v1/players.csv?page=${encodeURIComponent(page)}&filter=${encodeURIComponent(filter)}`
      }
      window.open(query)
    }
  },

  // populate the table with default parameters on page load
  mounted () {
    this.fetchTeams()
  }
}
</script>

<style lang="scss" scoped>
p {
  font-size: 2em;
  text-align: center;
}

.message {
  margin: 6.5rem;
}

th {
  background-color: Silver;

  & > a {
    white-space: nowrap;

    &.is-active {
      color: NavajoWhite;
    }
  }
}
</style>
