require 'sinatra'
# based on: http://stackoverflow.com/questions/735073/best-way-to-require-all-files-from-a-directory-in-ruby
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }

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
  "The answer is " + String(Kernel.send('p' + number))
end
