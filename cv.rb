module Colorize
  COLORS = {
    default: "\e[0m",
    red: "\e[31m",
    green: "\e[32m",
    yellow: "\e[33m",
    blue: "\e[34m",
    purple: "\e[35"
  }

  COLORS.each do |name, _|
    define_method name do |text|
      colorize(text, name)
    end
  end

  def colorize(text, color_code=:default)
    "#{COLORS.fetch(color_code)}#{text}\e[0m"
  end
end

class Developer
  attr_reader :name, :age, :work_experience, :portfolio, :current_projects

  include Colorize

  def initialize(name, age)
    @name = name
    @age  = age
    @work_experience = []
    @portfolio = []
    @current_projects = []
  end

  def add_work_experience(language, time, worked_on)
    @work_experience.push(
      { language: language,
        time: time,
        worked_on: worked_on
      }
    )
  end

  def add_portfolio(site, date, client, is_online, description)
    @portfolio.push(
      { site: site,
        date: date,
        client: client,
        is_online: is_online,
        description: description
      }
    )
  end

  def add_current_projects(name, technologies, description)
    @current_projects.push(
      { name: name,
        technologies: technologies,
        description: description
      }
    )
  end


  # Output
  def to_s
    puts
    puts blue("Name and Age:")
    puts green(@name)
    puts green(@age)
    puts
    puts red("Work Experience:")
    @work_experience.each do |w|
      puts green("Language: ") + w[:language]
      puts green("Time: ") + w[:time]
      puts green("Worked on: ") + w[:worked_on]
      puts
    end
    puts
    puts purple("Current Projects:")
    @current_projects.each do |cp|
      puts green("Name: ") + cp[:name]
      puts green("Technologies: ") + cp[:technologies]
      puts green("Description: ") + cp[:description]
      puts
    end
    puts
    puts yellow("Portfolio:")
    @portfolio.each do |p|
      puts green("Site: ") + p[:site]
      puts green("Date: ") + p[:date].to_s
      puts green("Client: ") + p[:client]
      puts green("Is online?: ") + p[:is_online].to_s
      puts green("Description: ") +p [:description]
      puts
    end
  end
end

me = Developer.new('Juan Andres Peon', 29)

# Work Experience
me.add_work_experience('PM/Lead Programmer/PHP/Javascript', '1.75  years', 'Replayful - www.replayful.com')
me.add_work_experience('PHP/Javascript', '1.5 years', 'Snzia Networks - Spanish Company')
me.add_work_experience('PHP/Javascript', '8 years', 'Freelance')

# Portfolio
me.add_portfolio(
  'http://www.irontrader.de/',
  2011,
  'Project while working on Replayful',
  false,
  "Jumped in the middle of the project to help out with the development after constraints on the schedule.
  Led the team and worked on the admin module, interacting with the Vimeo video service and the asset management using S3"
)

me.add_portfolio(
  'http://www.gosave.com/',
  2010,
  'Project while working on Replayful',
  true,
  "While inheriting a legacy site, it was scrapped and started from scratch.
  It's a Stores/Coupons site with a gaming/social twist. I've been the Project Manager/Lead Programmer for this project,
  while also doing the javascript after the loss (to Globant) of our front end developer. Went live (beta) on march 2011 but it' being re-launched on February 2012.
  The application interacts with different affiliate services for the coupons and purchases and the users earn points/coins (the 2 currencies on the site).
  The site is heavily integrated with Facebook and we're interacting with a socket server for the games (Smartfox Server)
  "
)
# Warning - Material X Rated
me.add_portfolio(
  'http://pornofo.com/',
  2010,
  'Project for Snzia Networks',
  false,
  "Porn (Tube) site. Started from scratch, has a comprehensive admin and scrapes other tube sites and blogs to extract videos,
  thumbnails and description. Categorizes the videos based on metatags or keywords found with a simple learning simple for unknown terms"
)
me.add_portfolio(
  'http://videospornolargos.es/',
  2010,
  'Project for Snzia Networks',
  false,
  "Porn site using a french provider. Had to extend the code of the site to enable SMS payments,
  custom views and listing plus, google translation (incredibly funny),
  adapt the code because of changes on the API. Had nothing to do with the design"
)
# Back to regular stuff
me.add_portfolio(
  'http://www.artigoo.com',
  2009,
  'Project for Snzia Networks',
  true,
  "Started this project while working for a spanish company. Most of the site for the beta version was developed by me,
  though enhancements had been made since delivery over the end of 2009"
)
me.add_portfolio(
  'http://www.santacruz.com.uy',
  2007,
  'Santa Cruz - La Casa del Freno',
  true,
  "Still up and running including the catalog and a generator for a static downloadable version. Also in process of being revamped"
)
me.add_portfolio(
  'Internal App',
  2006,
  'Management system for a Pet Food Delivery',
  false,
  "Internal web app for management of products, stock, delivery boys, schedule deliveries, buys and sells"
)
me.add_portfolio(
  'http://www.inmobiliariavinfor.com',
  2005,
  'Inmobiliaria Vinfor',
  true,
  "One of the first coded sites I've made, a long time ago, placed here because it's in process of being revamped"
)

# Current Projects
me.add_current_projects(
  'GoSave',
  'PHP using CodeIgniter and Doctrine as ORM/DBAL, Javascript using Mootools, Smartfox Server, Flash Games',
  "Site currently on beta since march 2011, involves heavy integration with Facebook (using both Javascript and PHP SDK's), secure backend for the games considering it supports 2 currencies and users can cash real (physical) rewards and
  interacts with 3 providers of stores/coupons.
  I've been in charge of dealing with the client (LA based), coordination of the team's workload and planning, architectural design, setting up the staging environment, definition and migration to the production environment.
  I'm also the Senior backend developer and Javascript developer.
  The current team involves 2 backend developers (1 senior also working on Javascript and 1 junior), 1 HTML/CSS guru, 2 flash developers (1 senior and 1 guru), 1 designer, 1 tester/QA specialist and me (PM/Tech Lead/Senior Backend/Javascript Dev)"
)
me.add_current_projects(
  'Workout In The Park',
  'PHP using CodeIgniter and Doctrine as ORM/DBAL, Javascript using Mootools and JQuery on the admin, Flash for the game',
  "It's a Facebook flash game \"a la\" Farmville. I've been working as the Tech Lead and developer of the backend of the game. I've designed the architecture and worked on the code of the backend.
  By client requirements we had to adapt the design to include Live Gamer for the stores/items/payment management and wrote a wrapper library including some magic finders to make it easier, as well as
  simplify the creation of batch scripts supported by the service (Javascript and Rhino). I also installed and deployed a CI Server (Jenkins) for automatic pulling, compiling of the assets and database migrations on the stage environment.
  "
)

# Output
me.to_s