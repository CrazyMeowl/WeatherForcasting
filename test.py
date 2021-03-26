import urllib.request
page = urllib.request.urlopen('http://dataservice.accuweather.com/locations/v1/cities/autocomplete?apikey=q651HeEBw5DCSyfxDwPoD64U4OSeGkpy&q=ho%20chi%20minh')
print(page.read())
