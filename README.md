# CombineIOS-BasicsSample
Some IOS samples using Combine framework 


Interview Questions related to Combine framework:


1. What is Combine, and why is it used?
Answer: Combine is Apple’s reactive programming framework for handling asynchronous events and data streams. It simplifies working with asynchronous code, enabling developers to process sequences of values over time using publishers and subscribers.

2. What are the core components of the Combine framework?
Answer:
* Publisher: Emits values over time.
* Subscriber: Receives and processes those values.
* Operator: Transforms, filters, or manipulates emitted values.
* Cancellable: Manages the lifecycle of a subscription.
* Subject: Acts as both a publisher and subscriber.

3. What is a Publisher in Combine?
Answer: A Publisher is a protocol that emits a sequence of values over time, either finishing successfully or failing with an error. Examples include Just, Future, and PassthroughSubject.

4. What is a Subscriber in Combine?
Answer: A Subscriber is an object that receives values from a publisher and reacts to them. Combine provides built-in subscribers like sink and assign.

5. What is the difference between sink and assign in Combine?
Answer:
* sink: A flexible subscriber that handles received values and completions using closures.
* assign: Assigns received values to a property of an object.
Example:

publisher.sink { print($0) }
publisher.assign(to: \.property, on: object)

6. What is a Subject in Combine?
Answer: A Subject is both a publisher and a subscriber. It allows manual emission of values. Common types are PassthroughSubject and CurrentValueSubject.

7. What are PassthroughSubject and CurrentValueSubject?
Answer:
* PassthroughSubject: Forwards values to subscribers but doesn’t store them.
* CurrentValueSubject: Retains the most recent value and provides it to new subscribers.

8. How does Combine handle errors?
Answer: Combine propagates errors through the failure type of the publisher. Operators like catch and retry can handle errors or retry operations.
Example:

publisher.catch { _ in Just("Recovered") }

9. What is a Future in Combine?
Answer: Future is a publisher that emits a single value or an error in the future. It’s often used for asynchronous operations like network requests.

10. How do you cancel a subscription in Combine?
Answer: Subscriptions in Combine are managed using Cancellable objects. Call .cancel() on the Cancellable object to stop the subscription.

————————————

11. What is the use of the combineLatest operator?
Answer: combineLatest merges multiple publishers, emitting a tuple of their latest values whenever any of them emits a new value.

12. What is the difference between merge and combineLatest?
Answer:
* merge: Combines multiple publishers into one, emitting values as they arrive from any publisher.
* combineLatest: Emits the latest value of each publisher as a tuple when any of them emits a value.

13. What is a Debounce operator in Combine?
Answer: debounce delays the emission of values by a specified time interval. It only emits the last value if no new values are received during the interval.

14. How does the flatMap operator work in Combine?
Answer: flatMap transforms the output of a publisher into a new publisher, flattening the resulting publishers into a single stream.

15. What is the role of Scheduler in Combine?
Answer: A Scheduler defines where and when to execute work, such as running tasks on the main thread or a background queue.

16. What is a Multicast in Combine?
Answer: multicast allows multiple subscribers to share a single subscription to an upstream publisher, reducing resource usage.

17. How do you handle backpressure in Combine?
Answer: Combine handles backpressure automatically by applying demand signals between publishers and subscribers to control data flow.

18. What is the map operator in Combine?
Answer: map transforms the output of a publisher into a new value using a provided closure.

19. What is the filter operator in Combine?
Answer: filter allows a publisher to emit only values that satisfy a given condition.

20. What are some common use cases for Combine?
Answer:
* Data binding between models and views.
* Handling asynchronous network requests.
* Debouncing and throttling user inputs.
* Combining multiple data sources.
* Error handling in complex workflows.
