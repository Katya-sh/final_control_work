package Animals;

import java.util.ArrayList;

public class Animal {
    private String name;
    private String birthday;
    private ArrayList commands = new ArrayList<String>();
    
    public Animal(String name, String birthday) {
        this.name = name;
        this.birthday = birthday;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }
    
    public String getCommands() {
        return commands.toString();
    }

    private void setCommands(String commands) {
        this.commands.add(commands);
    }




    @Override
    public String toString() {
        return "Animal [name=" + name + ", birthday=" + birthday + ", commands=" + commands + "]";
    }
}
