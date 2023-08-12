<template>
  <q-card class="q-pa-sm chat__card" flat style="overflow: auto;">
    <q-card-section>
      <div v-if="messages.bot.length" v-for="(msg, index) in messages.bot" :key="index">
        <q-chat-message avatar="../assets/bot.svg" :text="messages.bot[index]" text-color="white" bg-color="primary" />
        <q-chat-message avatar="../assets/user.svg" :text="messages.user[index]" sent />
      </div>
      <q-chat-message avatar="../assets/bot.svg" text-color="white" bg-color="primary" v-if="isMsgLoading"><q-spinner-dots
          size="2rem"></q-spinner-dots></q-chat-message>
      <q-chip color="blue" text-color="white" clickable v-for="option in answerArr" :key="option"
        @click="sendMessage(option[0])">{{ option[0] }}</q-chip>
    </q-card-section>
  </q-card>
</template>

<script setup>
import { onMounted, ref } from 'vue'

const isMsgLoading = ref(false)

const answerArr = ref(null)
const answerOptions = ref({
  global: [['Order pizza'], ['Set an alarm'], ["What is the weather?"], ['Tell me a joke']],
  alarm: [['6 am'], ['7 am'], ['8 am']],
  weather: [['sunny'], ['rainy'], ['cloudy']],
  jokes: [
    "Why don't scientists trust atoms? Because they make up everything.",
    "How do you make a tissue dance? Put a little boogey in it!",
    "Why do we tell actors to 'break a leg?' Because every play has a cast!",
    "What do you call a fish with no eyes? Fsh!",
    "Why did the scarecrow win an award? Because he was outstanding in his field!",
    "What do you call a lazy kangaroo? A pouch potato!",
    "Why did the bicycle fall over? Because it was two tired!",
    "What do you call a fish with no eyes? Fsh!",
    "Why did the golfer wear two pairs of pants? In case he got a hole in one!",
    "What do you call a cow with no legs? Ground beef!"
  ]
})

const messages = ref({
  bot: [],
  user: []
})

let alarmTime = null
onMounted(() => {
  messages.value.bot.push(['Hello sir, how can I help you?'])
  answerArr.value = answerOptions.value.global
})

function sendMessage(message) {
  toggleSpinner()
  messages.value.user.push([message])
  if (message === 'Order pizza') {
    answerWithDelay(['I ordered a pizza sir.', ['How can I help you?']])
  } else if (message === 'Set an alarm') {
    answerWithDelay(['Choose the time sir.'])
    answerArr.value = answerOptions.value.alarm
  } else if (message === 'What is the weather?') {
    const randomIndex = getRandomInt(answerOptions.value.weather.length)
    answerWithDelay([`The weather is ${answerOptions.value.weather[randomIndex]} sir.`, ['How can I help you?']])
  }

  if (message.endsWith('am')) {
    alarmTime = message
    answerWithDelay([`The alarm is set for ${alarmTime} sir.`, ['How can I help you?']])
    answerArr.value = answerOptions.value.global
  }

  if (message === 'Tell me a joke') {
    answerWithDelay([answerOptions.value.jokes[getRandomInt(answerOptions.value.jokes.length)], ['Was it funny sir? How can I help you?']])
  }
}

function answerWithDelay(msg) {
  setTimeout(() => {
    messages.value.bot.push(msg)
  }, 500);
}

function toggleSpinner() {
  isMsgLoading.value = true
  setTimeout(() => {
    isMsgLoading.value = false
  }, 500)
}

function getRandomInt(n) {
  return Math.floor(Math.random() * n);
}
</script>

<style>
.chat__card {
  height: 50vh;
  width: 100%;
}
</style>
