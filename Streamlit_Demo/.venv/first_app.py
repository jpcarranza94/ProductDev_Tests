import streamlit as st
import numpy as np
import pandas as pd
import time

st.title('This is my firts Application in Streamlit')

x = 4
st.write(x,' square is ', x**2)

x, ' square is ', x**2

"""
# Title
Here's our first attempt at using data to create a table:
"""

df = pd.DataFrame({
  'first column': [1, 2, 3, 4],
  'second column': [10, 20, 30, 40]
})

df

st.write("Here's our first attempt at using data to create a table:")
st.write(pd.DataFrame({
    'first column': [1, 2, 3, 4],
    'second column': [10, 20, 30, 40]
}))

chart_data = pd.DataFrame(
     np.random.randn(20, 3),
     columns=['a', 'b', 'c'])

st.line_chart(chart_data)

map_data = pd.DataFrame(
    np.random.randn(1000, 2) / [50, 50] + [37.76, -122.4],
    columns=['lat', 'lon'])

st.map(map_data)

if st.checkbox('Show dataframe'):
    map_data

"""
## Now we work with widgets
"""

'This is an slider example'

x = st.slider('x')
st.write(x**2)

option = st.selectbox(
    'Pick a Number',
     [5,25,35,45,55,65])

'You selected: ', option

option = st.sidebar.selectbox(
    'Please select one',
     ["hello","world", "!"])

st.sidebar.write('You selected: ', option)

'You selected: ', option

'Starting a long computation...'

# Initializing the variables
latest_iteration = st.empty()
bar = st.progress(0)

for i in range(100):
  # Update the progress bar with each iteration.
  latest_iteration.text(f'Iteration {i+1}')
  bar.progress(i + 1)
  time.sleep(0.1)

'...and now we\'re done!'

add_selectbox = st.sidebar.selectbox(
    'How would you like to be contacted?',
    ('Email', 'Home phone', 'Mobile phone')
)

add_slider = st.sidebar.slider(
    'Select a range of values',
    0.0, 100.0, (25.0, 75.0)
)