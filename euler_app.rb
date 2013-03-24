require 'sinatra'
get '/' do
  "Pick a Project Euler problem.
  <a href='/1/'>1</a>
  <a href='/2/'>2</a>
  <a href='/3/'>3</a>
  <a href='/4/'>4</a>
  <a href='/5/'>5</a>
  <a href='/6/'>6</a>
  <a href='/7/'>7</a>
  <a href='/8/'>8</a>
  <a href='/9/'>9</a>
  <a href='/10/'>10</a>
  <a href='/11/'>11</a>
  <a href='/12/'>12</a>
  <a href='/13/'>13</a>
  <a href='/14/'>14</a>
  <a href='/15/'>15</a>
  <a href='/16/'>16</a>
  <a href='/17/'>17</a>
  <a href='/18/'>18</a>
  <a href='/19/'>19</a>"
end

#get '/1/' do
#  'hello ' + '1'
#end
get '/*/' do
  number = params[:splat][0]
  require 'C:\Users\Noah\Documents\repos\project_euler_2nd\lib\problem' + number + '.rb'
  "The answer is " + String(Kernel.send('p' + number))
end