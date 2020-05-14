require "employee"

class Startup
  attr_reader :name, :funding, :salaries, :employees

  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = {}
    @employees = []

    salaries.each do |title, salary|
      @salaries[title] = salary
    end
  end

  def valid_title?(title)
    @salaries.keys.any?(title)
  end

  def >(startup)
    if startup.funding < self.funding
      true
    else
      false
    end
  end

  def hire(name, title)
    if !valid_title?(title)
      raise "error, not a valid title"
    else
      @employees << Employee.new(name, title)
    end
  end

  def size
    @employees.length
  end

  def pay_employee(employee)
    title = employee.title
    salary = @salaries[title]
    
    if @funding > salary
      Employee.pay(salary)
      @funding - salary
    else
      raise "error, not enough funds"
    end
  end


end
