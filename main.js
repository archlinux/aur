import { GoogleGenerativeAI } from "@google/generative-ai";
import readline from 'readline';
import dotenv from 'dotenv';
dotenv.config();

const genAI = new GoogleGenerativeAI(`${process.env.API_KEY}`);
const model = genAI.getGenerativeModel({ model: "gemini-1.5-flash" });

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

rl.question('Please enter a prompt for the AI: ', async (userInput) => {
  try {
    const result = await model.generateContent(userInput);
    console.log(result.response.text());
  } catch (error) {
    console.error('Error generating AI content:', error);
  } finally {
    rl.close();
  }
});