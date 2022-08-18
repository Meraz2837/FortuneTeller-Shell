#!/bin/bash
cgpa(){
   echo "---------------------------------------------"
   echo "Welcome to CGPA Calculation System"
   echo "---------------------------------------------"
   read -p "Enter number of subjects: " subjects
   Numbercredit=0
   Totalnumber=0
   Totalcredithour=0
   i=1
 
   while [ $i -le $subjects ]
   do
      read -p "Enter mark of subject $i : " marks
      read -p "Enter credit hour for subject $i : " credit

      if [ $marks -ge 80 ] && [ $marks -le 100 ]
      then cgpa=4.00
      elif [ $marks -ge 75 ] && [ $marks -le 80 ]
      then cgpa=3.75
      elif [ $marks -ge 70 ] && [ $marks -le 75 ]
      then cgpa=3.50
      elif [ $marks -ge 65 ] && [ $marks -le 70 ]
      then cgpa=3.25
      elif [ $marks -ge 60 ] && [ $marks -le 65 ]
      then cgpa=3.00
      elif [ $marks -ge 55 ] && [ $marks -le 60 ]
      then cgpa=2.75
      elif [ $marks -ge 50 ] && [ $marks -le 55 ]
      then cgpa=2.50
      elif [ $marks -ge 45 ] && [ $marks -le 50 ]
      then cgpa=2.25
      elif [ $marks -ge 40 ] && [ $marks -le 45 ]
      then cgpa=2.00
      elif [ $marks -ge 0 ] && [ $marks -le 40 ]
      then cgpa=0
      elif [ $marks -lt 0 ] || [ $marks -gt 100 ]
      then echo "Invalid Marks"
      fi
   
      Numbercredit=`echo $cgpa*$credit | bc`
      Totalnumber=`echo $Totalnumber+$Numbercredit | bc`
      Totalcredithour=`echo $Totalcredithour+$credit | bc`
      i=$(($i+1))
   done
   
   cgpa=$(echo "scale=2; $Totalnumber/$Totalcredithour" | bc -l)
   
   echo "--------------------------------------"
   echo "******** Your C.G.P.A : $cgpa *********"
   echo "--------------------------------------"    
}

waiver(){
   echo "-------------------------------------"
   echo "Welcome to Waiver Calculation System"
   echo "-------------------------------------"
   read -p "Enter total amount: " amount
   read -p "Enter waiver percentage: " percentage
   point=$(echo "scale=2; $percentage/100" | bc -l)
   needtosubtract=$(echo "scale=2; $amount*$point" | bc -l)
   waiver=$(echo "scale=2; $amount-$needtosubtract" | bc -l)
   echo "--------------------------------------"
   echo "Total payment : $waiver Taka"
   echo "--------------------------------------"
   half=$(echo "scale=2; $waiver/2" | bc -l)
   echo "--------------------------------------"
   echo "Payment before mid : $half Taka"
   echo "Payment before final : $half Taka"
   echo "--------------------------------------"
}


about(){
   echo "------------------------------------------------"
   echo "Project developed by : Team Meaningless Compiler"
   echo "------------------------------------------------"
   echo ""
   echo ""
   echo "------------------------------------------------"
   echo "                  Team Member                   "
   echo "------------------------------------------------"

   echo "------------------------------------------------"
   echo "              Md. Mazbaur Rashid"
   echo "                  192-15-2837"
   echo "------------------------------------------------"   
   echo "------------------------------------------------"
}

calculator(){
   echo "-------------------------------------"
   echo "    Use Calculator if necessary"
   echo "-------------------------------------"
   read -p "Enter 1st number: " num1
   read -p "Enter 2nd number: " num2
   read -p "Enter operator (+ - x /):" ops

   add(){
      result=$(($1+$2))
      return $result
   }
   sub(){
      result=$(($1-$2))
      return $result
   }
   mul(){
      result=$(($1*$2))
      return $result
   }
   div(){
      result=$(($1/$2))
      return $result
   }

   if [ $ops == "+" ]
   then {
      add $num1 $num2
      echo "$?"
   }
   elif [ $ops == "-" ]
   then {
      sub $num1 $num2
      echo "$?"
   }
   elif [ $ops == "x" ]
   then {
      mul $num1 $num2
      echo "$?"
   }
   elif [ $ops == "/" ]
   then {
      div $num1 $num2
      echo "$?"
   }
   fi
}

echo "---------------------------------------------------------------"
echo " Welcome to the DIU smart measures application : FortuneTeller"
echo "---------------------------------------------------------------"
echo "Menu"
echo "-------------------"
echo "Chose an option: "
echo "1. Calculate Waiver"
echo "2. Calculate CGPA"
echo "3. About"
echo "4. Use Calculator"
echo "-------------------"
read -p "Your choice? : " choice

if [ $choice == 1 ]
then waiver
elif [ $choice == 2 ]
then cgpa
elif [ $choice == 3 ]
then about
elif [ $choice == 4 ]
then calculator
fi
