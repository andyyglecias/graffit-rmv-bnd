# README

The city of Chicago is divided into 50 different wards. Each one of these wards are led by an elected official known as an alderman. Each month, numerous requests are made to remove graffiti in each of these wards. This is a Ruby on Rails project used that retrieves the api data for these wards and allows you to pull information to see how many graffiti removal requests were made each month through the usage of query parameters. 

Ex.) localhost:3000/graffiti-requests?alderman=Rodriguez&month=6&year=2018 will give you -

  {
  ward_number: "33",
  month: "6"
  graffiti_count: "371"
  alderman_full_name: "Rodriguez Sanchez, Rossana
  }
  
  You can change the values as you wish. 
  
  Ruby V- 2.5.1
  Rails V- 6.1.5
  
