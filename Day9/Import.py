def Extract (String):
        x = String.split(" ")
        return int(x[0]),int(x[6])

class Circle:
    Current_Value = 1
    Current_Index = 1
    List = [0]
    def add(self):
        Points=0
        L = len(self.List)
        Pos = 0

        if(self.Current_Value%23 == 0):
            Points=self.Current_Value
            Removing = self.Current_Index - 7
            if(Removing<0):
               
                Removing = (L-1)+Removing+1
                
            Points= Points+self.List[Removing]
            del self.List[Removing]
            Pos = Removing
        else:
            Pos = self.Current_Index + 2
            if(Pos>L):
                Pos=1
            self.List.insert(Pos,self.Current_Value)    
            
        #print(self.List)
        self.Current_Index=Pos 
        self.Current_Value=self.Current_Value+1
        return Points 