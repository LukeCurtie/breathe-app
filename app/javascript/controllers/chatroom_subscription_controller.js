import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { chatroomId: Number, currentUserId: Number, name: String}
  static targets = ["messages"]

  connect() {
    console.log("Connected to chatroom subscription controller")
    this.channel = createConsumer().subscriptions.create({ channel: "ChatroomChannel", chatroom_id: this.chatroomIdValue }, {
      received: (data) => {
        console.log('The data is', data)
        this.#insertMessageAndScrollDown(data)
      }
    })
    console.log(`Subscribed to the chatroom with the id ${this.chatroomIdValue}.`)
  }

  #insertMessageAndScrollDown(data) {
    const currentUserIsSender = this.currentUserIdValue === data.sender_id
    const messageElement = this.#buildMessageElement(currentUserIsSender, data.message, data.name)
    this.messagesTarget.insertAdjacentHTML("beforeend", messageElement)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }

  #justifyClass(currentUserIsSender) {
    return currentUserIsSender ? "position-right" : "position-left"
  }

  #justifyClassSender(currentUserIsSender) {
    return currentUserIsSender ? "sender" : "receiver"
  }

  #buildMessageElement(currentUserIsSender, message, name) {
    console.log(message)
    return `
      <div class=${this.#justifyClass(currentUserIsSender)}>
        <div class="message-box ${this.#justifyClassSender(currentUserIsSender)}">
          ${message}
        </div>
      </div>
    `
  }

  resetForm(event) {
    event.target.reset()
  }
  disconnect() {
    console.log("Disconnected from chatroom subscription controller")
    this.channel.unsubscribe()
  }
}
