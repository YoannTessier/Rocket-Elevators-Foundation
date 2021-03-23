class AddReferenceToIntervention < ActiveRecord::Migration[5.2]
  def change
    add_reference :interventions, :customers, foreign_key: true
    add_reference :interventions, :buildings, foreign_key: true
    add_reference :interventions, :batteries, foreign_key: true
    add_reference :interventions, :columns, foreign_key: true
    add_reference :interventions, :elevators, foreign_key: true
    add_reference :interventions, :employees, foreign_key: true
  end
end
