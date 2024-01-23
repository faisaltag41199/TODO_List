//
//  ViewController.m
//  OC_IOS_L1_06
//
//  Created by Faisal TagEldeen on 14/12/2023.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *resultTextField;
@property (weak, nonatomic) IBOutlet UIButton *allClearBtn;

@property double num1;
@property double num2;
@property double result;

@property int firstTime;
@property int isNum1FromTxtFieldInt;
@property int isNum2FromTxtFieldInt;
@property int isNegativeAdded;
@property char operator;
@property NSMutableArray * multiOperations;
@property int multiOperationTop;


-(bool) isInt:(NSString *) text;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self allClearHelper];
}

-(void) allClearHelper{
    
    _multiOperations=[NSMutableArray new];
    _resultTextField.text=@"0";
    _num1=0;
    _num2=0;
    _result=0;
    _firstTime=0;
    _isNum1FromTxtFieldInt=0;
    _isNum1FromTxtFieldInt=0;
    _isNegativeAdded=0;
    _multiOperationTop=0;
    
}

-(bool) isInt:(NSString *) text {
    
    NSMutableArray * textParts =[text componentsSeparatedByString:@"."];
    int partsNum=0;
    
    for(NSString * loopString in textParts){
        partsNum++;
        NSLog(@"string %@ : %d",loopString,partsNum);
    }
    
    return partsNum<2;
}
- (IBAction)divide:(id)sender {
    
    if([self isInt:_resultTextField.text])
    {
        int intNum =(int)[_resultTextField.text integerValue];
        printf("num is : %d and integer",intNum);
    
        
            _num1=intNum;
            _isNum1FromTxtFieldInt=1;
      
    }else{
        double doubleNum =(double)[_resultTextField.text doubleValue];
        printf("num is : %lf",doubleNum);
        _num1=doubleNum;
    }
    
    _operator='/';
    _resultTextField.text=@"0";
}

- (IBAction)multiply:(id)sender {
    
    
    if([self isInt:_resultTextField.text])
    {
        int intNum =(int)[_resultTextField.text integerValue];
        printf("num is : %d and integer",intNum);
    
            _num1=intNum;
            _isNum1FromTxtFieldInt=1;
      
    }else{
        double doubleNum =(double)[_resultTextField.text doubleValue];
        printf("num is : %lf",doubleNum);
        _num1=doubleNum;
    }
    
    _operator='*';
    _resultTextField.text=@"0";
    
}
- (IBAction)sub:(id)sender {
    
    if([self isInt:_resultTextField.text])
    {
        int intNum =(int)[_resultTextField.text integerValue];
        printf("num is : %d and integer",intNum);
    
            _num1=intNum;
            _isNum1FromTxtFieldInt=1;
      
    }else{
        double doubleNum =(double)[_resultTextField.text doubleValue];
        printf("num is : %lf",doubleNum);
        _num1=doubleNum;
    }
    
    _operator='-';
    _resultTextField.text=@"0";
    
}

- (IBAction)add:(id)sender {
    
        printf("in first operation");
        if([self isInt:_resultTextField.text])
        {
            int intNum =(int)[_resultTextField.text integerValue];
            printf("num is : %d and integer",intNum);
            
            _num1=intNum;
            _isNum1FromTxtFieldInt=1;
            
        }else{
            double doubleNum =(double)[_resultTextField.text doubleValue];
            _isNum1FromTxtFieldInt=0;
            printf("num is : %lf",doubleNum);
            _num1=doubleNum;
        }
    
        _operator='+';
        _resultTextField.text=@"0";
    
  //  [_multiOperations addObject:"+"];
   // [_multiOperations addObject:[@(_num1) stringValue]];
}

- (IBAction)result:(id)sender {
    
    
    if(_operator == '/' && _firstTime ==0 && [_resultTextField.text isEqual:@"0"]){

        _resultTextField.text = @"undifiend";
        return;
        
    }
    
    if(_operator == '/' && _firstTime ==0 && _num1 == 0 && ![_resultTextField.text isEqual:@"0"]){

        _resultTextField.text = @"0";
        
        return;
        
    }


    
    if(_firstTime == 0){
        _firstTime=1;
        printf("result == 0");
    
        
        
    if([self isInt:_resultTextField.text])
    {
        int intNum =(int)[_resultTextField.text integerValue];
        printf("num is : %d",intNum);
    
            _num2=intNum;
            _isNum2FromTxtFieldInt=1;
      
    }else{
        
        double doubleNum =(double)[_resultTextField.text doubleValue];
        printf("num is : %lf",doubleNum);
        _num2=doubleNum;
    }

        
   
    if(_num1!=0 && _num2!=0){
        switch(_operator){
                
            case '+':
                //both num is int
                if(_isNum1FromTxtFieldInt==1 && _isNum2FromTxtFieldInt==1){
                    
                    _result = _num1+_num2;
                    int finalResult = (int) _result;
                    _resultTextField.text=[@(finalResult) stringValue];
                }else{
                    //at least one num is double

                    _result=_num1+_num2;
                    _resultTextField.text=[@(_result) stringValue];
                    
                }
                
                break;
                
            case '-':
                //both num is int
                if(_isNum1FromTxtFieldInt==1 && _isNum2FromTxtFieldInt==1){
                    
                    _result = _num1-_num2;
                    int finalResult = (int) _result;
                    _resultTextField.text=[@(finalResult) stringValue];
                }else{
                    //at least one num is double

                    _result=_num1-_num2;
                    _resultTextField.text=[@(_result) stringValue];
                    
                }
                
                break;
                
            case '*':
                //both num is int
                if(_isNum1FromTxtFieldInt==1 && _isNum2FromTxtFieldInt==1){
                    
                    _result = _num1 * _num2;
                    int finalResult = (int) _result;
                    _resultTextField.text=[@(finalResult) stringValue];
                }else{
                    //at least one num is double

                    _result=_num1 * _num2;
                    _resultTextField.text=[@(_result) stringValue];
                    
                }
                
                break;
            case '/':
                
                //both num is int
                if(_isNum1FromTxtFieldInt==1 && _isNum2FromTxtFieldInt==1){
                    
                    
                    if((int)_num1 % (int)_num2==0){
                        
                        _result = _num1/_num2;
                        int finalResult = (int) _result;
                       _resultTextField.text=[@(finalResult) stringValue];
                    }else{
                        _result = _num1/_num2;
                       _resultTextField.text=[@(_result) stringValue];
                    }
                   
                }else{
                    //at least one num is double

                    _result=_num1/_num2;
                    _resultTextField.text=[@(_result) stringValue];
                }
                
                break;
                
        }

    }
        
    
        
    }else{
        
        //complete the operation with the same operator and num1 but num2 = result or new input
        
        
        if([self isInt:_resultTextField.text])
        {
            int intNum =(int)[_resultTextField.text integerValue];
            printf("num is : %d",intNum);
        
                _num2=intNum;
                _isNum2FromTxtFieldInt=1;
          
        }else{
            
            double doubleNum =(double)[_resultTextField.text doubleValue];
            printf("num is : %lf",doubleNum);
            _num2=doubleNum;
        }
        
        switch(_operator){
                
            case '+':
                //both num is int
                if(_isNum1FromTxtFieldInt==1 && _isNum2FromTxtFieldInt==1){
                    
                    _result = _num1+_num2;
                     int finalResult = (int) _result;
                    _resultTextField.text=[@(finalResult) stringValue];
                }else{
                    //at least one num is double

                    _result=_num1+_num2;
                    _resultTextField.text=[@(_result) stringValue];
                }
                
                break;
            case '-':
                //both num is int
                if(_isNum1FromTxtFieldInt==1 && _isNum2FromTxtFieldInt==1){
                    
                    _result = _num2 - _num1;
                    int finalResult = (int) _result;
                    _resultTextField.text=[@(finalResult) stringValue];
                }else{
                    //at least one num is double

                    _result=_num1 - _num2;
                    _resultTextField.text=[@(_result) stringValue];
                    
                }
                
                break;
            case '*':
                //both num is int
                if(_isNum1FromTxtFieldInt==1 && _isNum2FromTxtFieldInt==1){
                    
                    _result = _num1 * _num2;
                    int finalResult = (int) _result;
                    _resultTextField.text=[@(finalResult) stringValue];
                }else{
                    //at least one num is double

                    _result=_num1 * _num2;
                    _resultTextField.text=[@(_result) stringValue];
                    
                }
                
                break;
        
            case '/':
                //both num is int
                
                if(_isNum1FromTxtFieldInt==1 && _isNum2FromTxtFieldInt==1){
                    
                    if((int)_num1 % (int)_num2==0){
    
                        _result = _num2/_num1;
                        int finalResult = (int) _result;
                       _resultTextField.text=[@(finalResult) stringValue];
                    }else{
                        
                        _result = _num2/_num1;
                       _resultTextField.text=[@(_result) stringValue];
                  
                    }
                   
                }else{
                    //at least one num is double
                    
                    _result=_num2/_num1;
                    _resultTextField.text=[@(_result) stringValue];
                    _isNum2FromTxtFieldInt=0;
                    
                }
                
                break;
        }
    }
    //_allClearBtn.titleLabel.text=@"C";
    
}
- (IBAction)negative:(id)sender {
    
    if ([_resultTextField.text rangeOfString:@"-"].location == NSNotFound && ![_resultTextField.text isEqual:@"0"]) {
        
        _resultTextField.text = [@"-" stringByAppendingString:_resultTextField.text];
        
    } else {
        
        NSRange replaceRange = [_resultTextField.text rangeOfString:@"-"];
        if (replaceRange.location != NSNotFound){
            _resultTextField.text = [_resultTextField.text stringByReplacingCharactersInRange:replaceRange withString:@""];
        }

    }
    
}
- (IBAction)allClear:(id)sender {
    
    [self allClearHelper];

}

- (IBAction)dot:(id)sender {
    
    
    if(![_resultTextField.text  isEqual: @"0"]){
        
        NSMutableArray *nsDotArray = [_resultTextField.text componentsSeparatedByString:@"."];
        
        if(!([nsDotArray count] >=2)){
            
            _resultTextField.text=
            [_resultTextField.text stringByAppendingString:@"."];
            
        }
        
    }else{
        _resultTextField.text=@"0.";
    }
    
}

- (IBAction)nine:(id)sender {
    if(![_resultTextField.text  isEqual: @"0"]){
        _resultTextField.text=
        [_resultTextField.text stringByAppendingString:@"9"];
    }else{
        _resultTextField.text=@"9";
    }
}

- (IBAction)eight:(id)sender {
    
    if(![_resultTextField.text  isEqual: @"0"]){
        _resultTextField.text=
        [_resultTextField.text stringByAppendingString:@"8"];
    }else{
        _resultTextField.text=@"8";
    }
}

- (IBAction)seven:(id)sender {
    
    if(![_resultTextField.text  isEqual: @"0"]){
        _resultTextField.text=
        [_resultTextField.text stringByAppendingString:@"7"];
    }else{
        _resultTextField.text=@"7";
    }
}

- (IBAction)six:(id)sender {
    if(![_resultTextField.text  isEqual: @"0"]){
        _resultTextField.text=
        [_resultTextField.text stringByAppendingString:@"6"];
    }else{
        _resultTextField.text=@"6";
    }
}

- (IBAction)five:(id)sender {
    
    if(![_resultTextField.text  isEqual: @"0"]){
        _resultTextField.text=
        [_resultTextField.text stringByAppendingString:@"5"];
        
    }else{
        _resultTextField.text=@"5";
    }
}


- (IBAction)four:(id)sender {
    if(![_resultTextField.text  isEqual: @"0"]){
        _resultTextField.text=
        [_resultTextField.text stringByAppendingString:@"4"];
    }else{
        _resultTextField.text=@"4";
    }
}

- (IBAction)three:(id)sender {
    
    if(![_resultTextField.text  isEqual: @"0"]){
        _resultTextField.text=
        [_resultTextField.text stringByAppendingString:@"3"];
        
    }else{
        _resultTextField.text=@"3";
    }
}

- (IBAction)two:(id)sender {
    
    if(![_resultTextField.text  isEqual: @"0"]){
        _resultTextField.text=
        [_resultTextField.text stringByAppendingString:@"2"];
    }else{
        _resultTextField.text=@"2";
    }
}

- (IBAction)one:(id)sender {
    
    if(![_resultTextField.text  isEqual: @"0"]){
        _resultTextField.text=
        [_resultTextField.text stringByAppendingString:@"1"];
    }else{
        _resultTextField.text=@"1";
    }
}

-(IBAction)zero:(id)sender {
    
    if(![_resultTextField.text  isEqual: @"0"]){
        _resultTextField.text=
        [_resultTextField.text stringByAppendingString:@"0"];
        
    }else{
        _resultTextField.text=@"0";
    }
   
}

@end
