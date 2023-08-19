#include <stdlib.h>
#include <stdio.h>
#include "tensorflow/c/c_api.h"

// From https://github.com/AmirulOm/tensorflow_capi_sample
//  via https://medium.com/analytics-vidhya/deploying-tensorflow-2-1-as-c-c-executable-1d090845055c

void NoOpDeallocator(void* data, size_t a, void* b) {}
int main()
{
     //********* Read model
    TF_Graph* Graph = TF_NewGraph();
    TF_Status* Status = TF_NewStatus();
    TF_SessionOptions* SessionOpts = TF_NewSessionOptions();
    TF_Buffer* RunOpts = NULL;
    
    const char* saved_model_dir = "test_model_c/"; 
    const char* tags = "serve"; 
    
    int ntags = 1;
    TF_Session* Session = TF_LoadSessionFromSavedModel(SessionOpts, RunOpts, saved_model_dir, &tags, ntags, Graph, NULL, Status);
    
    if(TF_GetCode(Status) == TF_OK) {
        // printf("TF_LoadSessionFromSavedModel OK\n");
    } else {
        printf("%s",TF_Message(Status));
    }
    //****** Get input tensor
    int NumInputs = 1;
    
    TF_Output* Input = malloc(sizeof(TF_Output) * NumInputs);
    TF_Output t0 = {TF_GraphOperationByName(Graph, "serving_default_input_1"), 0};
    
    if(t0.oper == NULL)
        printf("ERROR: Failed TF_GraphOperationByName serving_default_input_1\n");
    else {
        // printf("TF_GraphOperationByName serving_default_input_1 is OK\n");
    }
    
    Input[0] = t0;
    
    //********* Get Output tensor
    int NumOutputs = 1;
    TF_Output* Output = malloc(sizeof(TF_Output) * NumOutputs);
    TF_Output t2 = {TF_GraphOperationByName(Graph, "StatefulPartitionedCall"), 0};
    
    if(t2.oper == NULL)
        printf("ERROR: Failed TF_GraphOperationByName StatefulPartitionedCall\n");
    else {
        // printf("TF_GraphOperationByName StatefulPartitionedCall is OK\n");
    }
    
    Output[0] = t2;

    //********* Allocate data for inputs & outputs
    TF_Tensor** InputValues  = (TF_Tensor**)malloc(sizeof(TF_Tensor*)*NumInputs);
    TF_Tensor** OutputValues = (TF_Tensor**)malloc(sizeof(TF_Tensor*)*NumOutputs);
    
    int ndims = 2;
    int64_t dims[] = {1,1};
    int64_t data[] = {20};
    
    int ndata = sizeof(int64_t); 
    TF_Tensor* int_tensor = TF_NewTensor(TF_INT64, dims, ndims, data, ndata, &NoOpDeallocator, 0);
    
    if (int_tensor != NULL) {
        // printf("TF_NewTensor is OK\n");
    } else {
        printf("ERROR: Failed TF_NewTensor\n");
    }
    
    InputValues[0] = int_tensor;

    // Run the Session
    TF_SessionRun(Session, NULL, Input, InputValues, NumInputs, Output, OutputValues, NumOutputs, NULL, 0,NULL , Status);
    
    if(TF_GetCode(Status) == TF_OK) {
        // printf("Session is OK\n");
    } else {
        printf("%s",TF_Message(Status));
    }

    // Free memory
    TF_DeleteGraph(Graph);
    TF_DeleteSession(Session, Status);
    TF_DeleteSessionOptions(SessionOpts);
    TF_DeleteStatus(Status);

    void* buff = TF_TensorData(OutputValues[0]);
    float* offsets = buff;
    // printf("Result Tensor :\n");
    // printf("%f\n",offsets[0]);
    // printf("Expected :\n");
    // printf("20.000000\n");
    return offsets[0] != 20.0f; // true/1 for failure, false/0 for success.
}