feature 'Adding tags' do
	scenario 'I can add a single tag to a new link' do
		visit '/tasks/new'
		click_button 'Create task'
		task = Task.first
		expect(task.tags.map(&:name)).to include('home')
	end

  before(:each) do
    Task.create(task_name: 'Make dinner', date: '2050-08-22', tags: [Tag.first_or_create(name: 'home food')])
    Task.create(task_name: 'Washing machine', date: '2040-08-22', tags: [Tag.first_or_create(name: 'home')])
    Task.create(task_name: 'Play table tennis', date: '2050-08-22', tags: [Tag.first_or_create(name: 'sport')])
  end

  scenario 'I can filter tasks by tag' do
    visit'/tags/home'
    within 'ul#tasks' do
      expect(page).to have_content('Washing machine')
      expect(page).not_to have_content('Play table tennis')
    end
  end

  scenario 'I can add multiple tags to a new task' do 
    visit '/tasks/new'
    task = Task.first
    expect(task.tags.map(&:name)).to include('home','food')
  end 

end
