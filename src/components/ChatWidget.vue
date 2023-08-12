<template>
  <q-card class="q-pa-sm chat__card" flat>
    <q-card-section>
      <q-chat-message avatar="https://cdn.quasar.dev/logo/svg/quasar-logo.svg" :text="messages.bot"></q-chat-message>
      <q-chat-message avatar="https://cdn.quasar.dev/logo/svg/quasar-logo.svg" :text="messages.user"
        sent></q-chat-message>
    </q-card-section>
  </q-card>
</template>

<script setup>
import { onMounted, ref } from 'vue'

const messages = ref({
  bot: [],
  user: []
})

onMounted(() => {
  setTimeout(() => {
    messages.value.bot.push('Hello, how can I help you?')
  }, 1000)
})
</script>

<style>
.chat__card {
  height: 50%;
  width: 100%;
}
</style>
