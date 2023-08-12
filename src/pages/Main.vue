<template>
  <q-page class="flex q-pa-md no-wrap">
    <div class="flex text-center column align-center">
      <h1 class="text-h3 text-white text-bold">Vue Simple ChatBot</h1>
      <p class="text-h5 text-white">A simple Vue chatbot component</p>
    </div>
    <q-space></q-space>
    <ChatWidget />
  </q-page>
</template>

<script setup>
import ChatWidget from 'src/components/ChatWidget.vue';

</script>
