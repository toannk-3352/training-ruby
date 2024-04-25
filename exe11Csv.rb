# Viết ứng dụng quản lí máy tính trong SUN
# Lưu thông tin user, máy tính qua 1 file json / csv
#
# - Đăng nhập > nhập user/pass >  kiểm tra trong file json
# - kiểm tra quyền của user
#
# Nếu là Admin thì cho sử dụng các chức năng
# - thêm, sửa, xoá, search      info máy tính
# - thêm sửa xioá user
#
# Nếu là User thì cho sử dụng các chức năng
# - search info máy tính
require 'csv'
require 'json'
class ComputerManager
  def initialize
    @data = load_data
    puts @data
  end

  def load_data
    hash_array_computers = []
    hash_array_users = []
    CSV.foreach('computer_data.csv', headers: true) do |row|
      hash_array_computers << row.to_h
    end
    CSV.foreach('user_data.csv', headers: true) do |row|
      hash_array_users << row.to_h
    end
    {
      'computers' => hash_array_computers, 'users' => hash_array_users
    }
  end

  def save_data_computer
    CSV.open('computer_data.csv', 'w') do |csv|
      csv << @data["computers"].first.keys
      @data["computers"].each do |hash|
        csv << hash.values
      end
    end
  end
  
  def save_data_user
    CSV.open('user_data.csv', 'w') do |csv|
      csv << @data["users"].first.keys
      @data["users"].each do |hash|
        csv << hash.values
      end
    end
  end
  
  def login(username, password)
    user = @data['users'].find { |u| u['username'] == username && u['password'] == password }
    return user if user

    puts 'Invalid username or password'
    nil
  end

  def check_permission(user)
    user['role']
  end

  def check_id_computer?(id)
    computer = @data['computers'].find { |c| c['id'] == id }
    computer ? true : false
  end

  def check_username?(username)
    user = @data['users'].find { |u| u['username'] == username }
    user ? true : false
  end

  def add_computer
    computers = @data['computers']
    print 'Enter computer id: '
    id = gets.chomp
    if check_id_computer?(id)
      puts "Computer id #{id} already exist"
      return
    end
    print 'Enter computer name: '
    name = gets.chomp
    computers.append({ 'id' => id, 'name' => name })
    @data['computers'] = computers
    save_data_computer
  end

  def edit_computer
    computers = @data['computers']
    print 'Enter computer id to edit: '
    id = gets.chomp
    unless check_id_computer?(id)
      puts "Computer id #{id} not exist"
      return
    end
    print 'Enter new computer name: '
    name = gets.chomp
    computers.map do |c|
      c['name'] = name if c['id'] == id
    end
    @data['computers'] = computers
    save_data_computer
  end

  def search_computer
    computers = @data['computers']
    puts computers
    puts 'Enter computer id or key to search: '
    key = gets.chomp
    results = computers.select do |c|
      c['id'].include?(key) || c['name'].include?(key)
    end
    puts 'Not found' if results.length == 0
    puts results if results.length > 0
  end

  def delete_computer
    computers = @data['computers']

    print 'Enter computer id to delete: '
    id = gets.chomp

    unless check_id_computer?(id)
      puts "Computer id #{id} not exist"
      return
    end

    computers.reject! { |x| x['id'] == id }

    @data['computers'] = computers
    save_data_computer
  end

  def add_user
    users = @data['users']
    puts users

    print 'Enter username: '
    username = gets.chomp
    if check_username?(username)
      puts 'Username already exist!'
      return
    end
    print 'Enter password: '
    password = gets.chomp
    print 'Select role 1. Admin 2. User: '
    role = gets.chomp.to_i
    case role
    when 1
      role = 'Admin'
    when 2
      role = 'User'
    else
      puts 'Invalid role'
      return
    end
    users.append({ 'username' => username, 'password' => password, 'role' => role })
    @data['users'] = users
    save_data_user
  end

  def edit_user
    users = @data['users']
    print 'Enter username to delete: '
    username = gets.chomp
    unless check_username?(username)
      puts 'Username not exist!'
      return
    end
    print 'Enter new password: '
    password = gets.chomp
    users.map do |u|
      u['password'] = password if u['username'] == username
    end
    @data['users'] = users
    save_data_user
  end

  def delete_user
    users = @data['users']
    print 'Enter username to edit: '
    username = gets.chomp
    unless check_username?(username)
      puts 'Username not exist!'
      return
    end

    users.reject! { |u| u['username'] == username }

    @data['users'] = users
    save_data_user
  end

  def user_menu
    loop do
      20.times { print '-' }
      puts
      puts '---- Menu user ----'
      puts '1. Search info computer'
      puts '0. Press 0 to logout'
      print 'Enter your choice: '
      choice = gets.chomp.to_i
      puts
      case choice
      when 1
        puts 'Search info computer'
        search_computer
      when 0
        puts 'Exit'
        return
      else
        puts 'Invalid choice'
      end
    end
  end

  def admin_menu
    loop do
      20.times { print '-' }
      puts
      puts '---- Menu admin ----'
      puts '1. Add info computer'
      puts '2. Edit info computer'
      puts '3. Delete info computer'
      puts '4. Search info computer'
      puts '5. Add user'
      puts '6. Edit user'
      puts '7. Delete user'
      puts '0. Press 0 to logout'
      print 'Enter your choice: '
      choice = gets.chomp.to_i
      puts
      case choice
      when 1
        puts 'Add infor computer'
        add_computer
      when 2
        puts 'Edit infor computer'
        edit_computer
      when 3
        puts 'Delete infor computer'
        delete_computer
      when 4
        puts 'Search infor computer'
        search_computer
      when 5
        puts 'Add user'
        add_user
      when 6
        puts 'Edit user'
        edit_user
      when 7
        puts 'Delete user'
        delete_user
      when 0
        puts 'Exit'
        return
      else
        puts 'Invalid choice'
      end
    end
  end

  def run
    loop do
      puts 'Login'
      20.times { print '-' }
      puts
      print 'Username: '
      username = gets.chomp
      puts
      print 'Password: '
      password = gets.chomp
      puts
      user = login(username, password)
      next unless user

      role = check_permission(user)

      case role
      when 'Admin'
        admin_menu
      when 'User'
        user_menu
      else
        puts 'Invalid role'
      end
    end
  end
end

program = ComputerManager.new
program.run
