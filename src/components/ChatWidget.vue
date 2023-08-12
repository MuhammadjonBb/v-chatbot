<template>
  <q-card class="q-pa-sm chat__card" flat style="overflow: auto;">
    <q-card-section>
      <div v-if="messages.bot.length" v-for="(msg, index) in messages.bot" :key="index">
        <q-chat-message avatar="../assets/bot.svg" :text="messages.bot[index]" text-color="white" bg-color="primary" />
        <q-chat-message avatar="../assets/user.svg" :text="messages.user[index]" sent />
      </div>
      <q-chip color="blue" text-color="white" clickable v-for="option in answerArr" :key="option"
        @click="sendMessage(option[0])">{{ option[0] }}</q-chip>
    </q-card-section>
  </q-card>
</template>

<script setup>
import { onMounted, ref } from 'vue'

const answerArr = ref(null)
const answerOptions = ref({
  global: [['Order pizza'], ['Set an alarm'], ["What is the weather?"]],
  alarm: [['6 am'], ['7 am'], ['8 am']],
  weather: [['sunny'], ['rainy'], ['cloudy']]
})

const messages = ref({
  bot: [],
  user: []
})

let alarmTime = null

onMounted(() => {
  messages.value.bot.push(['Hello, how can I help you?'])
  answerArr.value = answerOptions.value.global
})

function sendMessage(message) {
  messages.value.user.push([message])
  if (message === 'Order pizza') {
    messages.value.bot.push(['I ordered a pizza sir. How can I help you?'])
  } else if (message === 'Set an alarm') {
    messages.value.bot.push(['Choose the time sir.'])
    answerArr.value = answerOptions.value.alarm
  } else if (message === 'What is the weather?') {
    const randomIndex = Math.floor(Math.random() * answerOptions.value.weather.length);
    messages.value.bot.push([`The weather is ${answerOptions.value.weather[randomIndex]} sir. How can I help you?`])
  }

  if (message.endsWith('am')) {
    alarmTime = message
    messages.value.bot.push([`The alarm is set for ${alarmTime} sir. How can I help you?`])
    answerArr.value = answerOptions.value.global
  }
}
</script>

<style>
.chat__card {
  height: 50%;
  width: 100%;
}
</style>
