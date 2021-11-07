---
layout: post
title: Sorting Visualizer
date: 2021-10-21
---

With school and a hunt for a job going on, it's been a struggle to find time
for projects, but I'm really glad I got to make
[this](https://arefmalek.github.io/Sorting_Visualizer/)!
This project was definitely one of my bigger introductions to Javascript
(and possibly more appropriately, my entry to the "I hate Javascript" club).
That being said there were three difficult parts of the project:

## 1. Drawing random arrays

Since this was a little bit more of an introduction to JS for me, I decided to make this project with canvas.
Regardless of the approach, a central part of the experience is generating random arrays on demand; 
this way, you should be able to see how "any random array" can be sorted in a given amount of time by a sorting algorithm.
That means I had to figure out how to draw
a brand new array to the canvas on any given moment. I personally struggled
with dynamically drawing to the canvas until I set up the draw_array
function  - heavily inspired by `draw_array` 
[function](https://cs.stanford.edu/people/jcjohns/sorting.js/js/sorting.js) from Justin Johnson.

## 2. Animation
#### 2.1 Colors
Now that we can draw any given array to a canvas, how do we *show* that the animations are happening?
The key was also storing "colors" for each index (also very heavily inspired by the `draw_array` function`) - this way, any 'comparison'/'swap' came down to just changing colors at indexes and performing operations as needed.

#### 2.2 Synchronizing (async async async functions)
A big thing about Javascript I just didn't know before I started this project is that a lot of things are synchronized from the get-go. This would mean a lot of what I wrote had to be asynchronous. At first I thought this would be super serious, but the concept is more straightforward than I thought. Essentially a statement in Python that would look like this
```
sleep(500);
print("Hi ma!");
```
The interpreter would stall for half a second before printing the statement. However in Javascript, a single thread would deal with the sleep statement and another would print time, so implementing my operations like this
```
if (leftLessThanRight(num1, num2) === true) {
    swap(num1, num2); 
    sleep(time);
}
```
just would not work from the jump. However, `async` functions solve this issue entirely by making code operate the way I mentioned in the first sample (alongside adding `await` to the function call). So our all "asynchronized code" means here is this (taking my swapping code for example).
```
// helper function for timing
function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

async function swap(arr, index1, index2) {
    /**
     * The helper function for swapping
     */
    const temp = randomArray[index1];
    randomArray[index1] = randomArray[index2];
    randomArray[index2] = temp;

    colors[index1] = SWAP_COLOR;
    colors[index2] = SWAP_COLOR;

    draw_array(canvas, arr, colors);

    await sleep(SPEED);
    colors[index1] = DEFAULT_COLOR;
    colors[index2] = DEFAULT_COLOR;
}
```
Adding a layer of abstraction now, within my own sorting functions, all I had to do was call `await swap(arr, num1, num2)`. So with a couple of edits, we got exactly what we were looking for from that initial Python Snippet.

## 3. Implementing O(nlog(n)) Algorithms:
I'll keep this one short because I only did heap sort so far, but a current challenge I'm facing is one where recursive algorithms like merge sort and quick sort will be difficult to call because my canvas element takes an entire array, rather than smaller arrays to merge. I don't really have a complete solution but I thought I would just leave this on a pin for now.


The project was super fun all in all - glad I got some more exposure to the basic web stack used all over the world. 