<template>
  <q-page class="flex q-pa-md wrap"
    :class="{ 'column': $q.screen.xs || $q.screen.sm }, { 'justify-start': $q.screen.sm || $q.screen.xs }, { 'justify-around': $q.screen.md || $q.screen.xl || $q.screen.lg }">
    <div class="flex text-center column justify-center"
      :class="{ 'q-mb-lg': $q.screen.xs || $q.screen.sm || $q.screen.md }">
      <h1 class="text-h3 text-white text-bold" :class="{ 'text-h4': $q.screen.sm || $q.screen.xs }">
        Vue Simple ChatBot
      </h1>
      <p class="text-h5 text-white" :class="{ 'text-h6': $q.screen.md || $q.screen.sm || $q.screen.xs }">A simple Vue
        chatbot component</p>
    </div>
    <div class="flex items-center chat chat__container" :class="{ 'q-mx-auto': $q.screen.xs || $q.screen.sm }">
      <ChatWidget />
    </div>
  </q-page>
</template>

<script setup>
import ChatWidget from 'src/components/ChatWidget.vue';
</script>

<style lang="scss">
.chat {
  &__container {
    width: 30%;
  }
}

@media (max-width: 1023.99px) {
  .chat__container {
    width: 70%;
  }
}

@media (max-width: 599.99px) {
  .chat__container {
    width: 100%;
  }
}
</style>
