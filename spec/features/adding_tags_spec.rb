feature 'Adding tags' do 
	scenario 'I can add a single tag to a new link' do 
		visit '/tasks/new'
		fill_in 'task_name', with: 'Make dinner'
		fill_in 'date', with: '2015-09-27'

		fill_in 'tag', with: 'food'

		click_button 'Create task'
		task = Task.first
		expect(task.tags).to include('food')
	end 
end 