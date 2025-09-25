
more_movies = [
    {:title => 'My Neighbor Totoro', :rating => 'G',
      :release_date => '16-Apr-1988'},
    {:title => 'Green Book', :rating => 'PG-13',
      :release_date => '16-Nov-2018'},
    {:title => 'Parasite', :rating => 'R',
      :release_date => '30-May-2019'},
    {:title => 'Nomadland', :rating => 'R',
      :release_date => '19-Feb-2021'},
    {:title => 'CODA', :rating => 'PG-13',
      :release_date => '13-Aug-2021'},
    # New movies added to meet requirements
    {:title => 'The Godfather', :rating => 'R',
      :release_date => '24-Mar-1972'},
    {:title => 'Alien', :rating => 'R',
      :release_date => '25-May-1979'},
    {:title => 'Dune', :rating => 'PG-13',
      :release_date => '22-Oct-2021'}
  ]
  
  more_movies.each do |movie|
    # Use find_or_create_by to avoid creating duplicates
    Movie.find_or_create_by!(movie)
  end