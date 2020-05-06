require "../lib/spell.rb"
def load board
	return Spell.new("Add", board) {|x|}
end