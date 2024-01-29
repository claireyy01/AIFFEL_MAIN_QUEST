퀘스트 README.md

- 코더 : 김양희
- 리뷰어 : 이선재


🔑 **PRT(Peer Review Template)**

- [X]  **1. 주어진 문제를 해결하는 완성된 코드가 제출되었나요?**
    - 문제에서 요구하는 최종 결과물이 첨부되었는지 확인
    - 문제를 해결하는 완성된 코드란 프로젝트 루브릭 3개 중 2개, 
    퀘스트 문제 요구조건 등을 지칭
        - 해당 조건을 만족하는 부분의 코드 및 결과물을 근거로 첨부
     
```
  # 부정적인 프롬프트 추가해보기
  
  from diffusers import UniPCMultistepScheduler
  # 기존 스케줄러 구성에서 생성된 UniPCMultistepScheduler 인스턴스로 canny_pipe 인스턴스의 스케줄러를 업데이트합니다.
  canny_pipe.scheduler = UniPCMultistepScheduler.from_config(canny_pipe.scheduler.config)
  # canny_pipe 인스턴스를 CUDA 장치로 이동
  canny_pipe = canny_pipe.to("cuda")
  
  # 동일한 이미지를 생성하기 위해 seed를 지정합니다. 
  generator = torch.manual_seed(0)  
  
  # 이미지를 생성합니다. 
  canny_image = canny_pipe(
      prompt="disco dancer with colorful lights", 
      negative_prompt="dark, still, quiet, monochromatic, dull, low-quality, blurry",
      num_inference_steps=20, 
      generator=generator, 
      image=canny_image
  ).images[0]
  
  # 생성된 이미지를 저장합니다. 
  canny_image.save("/aiffel/aiffel/canny_image.png")  
  
  # 생성된 이미지를 출력합니다. 
  canny_image
```  
<img width="515" alt="스크린샷 2024-01-29 오후 5 53 14" src="https://github.com/thetjswo/AIFFEL_MAIN_QUEST_kyh/assets/74177040/f3f43f27-1f28-4cdc-8904-c3db64f8bc18">  
[리뷰] 프롬프트와 하이퍼 파라미터값을 적절하게 변경하여 요구하는 루브릭을 충족하였다.  

```
# 하이퍼파라미터 변경 - 새로운 이미지 생성 
openpose_image2 = openpose_pipe(
    prompt = "disco dancer with colorful lights", 
    negative_prompt = "dark, still, quiet, monochromatic, dull, low-quality, blurry", 
    num_inference_steps=30, 
    guidance_scale=8.0, 
    generator=generator, 
    image=openpose_image
).images[0]

# 생성된 이미지를 출력합니다. 
openpose_image2
```
<img width="512" alt="스크린샷 2024-01-29 오후 5 54 00" src="https://github.com/thetjswo/AIFFEL_MAIN_QUEST_kyh/assets/74177040/3c976fd3-1c9b-44a9-8ed1-158f549bec94">  
[리뷰] 인체 자세 검출 전처리기를 변경하여 윤곽선 검출 조건을 준 이미지를 생성하였다.  

```
# controlnets 리스트 만들어 파이프라인으로 전달하기

from diffusers import StableDiffusionControlNetPipeline, ControlNetModel, UniPCMultistepScheduler  

# Q. 코드를 작성해 보세요.
# Edge Detection과 Openpose, 2개의 전처리기를 controlnets라는 리스트로 만듭니다. 
canny_controlnet = ControlNetModel.from_pretrained("lllyasviel/sd-controlnet-canny", torch_dtype=torch.float16)
openpose_controlnet = ControlNetModel.from_pretrained("lllyasviel/sd-controlnet-openpose", torch_dtype=torch.float16)
controlnets = [canny_controlnet, openpose_controlnet] 

# 리스트 controlnets를 파이프라인으로 전달합니다. 
pipe = StableDiffusionControlNetPipeline.from_pretrained(
    "runwayml/stable-diffusion-v1-5", controlnet=controlnets, torch_dtype=torch.float16
)

pipe.scheduler = UniPCMultistepScheduler.from_config(pipe.scheduler.config)
pipe = pipe.to("cuda")

# 프롬프트를 작성합니다. 
prompt = "disco dancer with colorful lights"
negative_prompt = "dark, still, quiet, monochromatic, dull, low-quality, blurry"

# seed를 지정합니다. 
generator = torch.manual_seed(0)  

images = [openpose_image, canny_image]

# 이미지를 생성합니다. 
image = pipe(prompt=prompt, negative_prompt=negative_prompt, num_inference_steps=20, generator=generator, image=images).images[0]

# 생성된 이미지를 저장합니다.
image.save("/aiffel/aiffel/multi_controlnet_output.png")

# 생성된 이미지를 출력합니다.  
image
```
<img width="513" alt="스크린샷 2024-01-29 오후 5 54 42" src="https://github.com/thetjswo/AIFFEL_MAIN_QUEST_kyh/assets/74177040/f83e5a85-d77e-4491-912c-660a2dd70baa">  
[리뷰] 윤곽선 검출과 인체 자세 검출 전처리기를 이용하여 이미지를 생성하였다.  

---
    
- [X]  **2. 전체 코드에서 가장 핵심적이거나 가장 복잡하고 이해하기 어려운 부분에 작성된 
주석 또는 doc string을 보고 해당 코드가 잘 이해되었나요?**
    - 해당 코드 블럭에 doc string/annotation이 달려 있는지 확인
    - 해당 코드가 무슨 기능을 하는지, 왜 그렇게 짜여진건지, 작동 메커니즘이 뭔지 기술.
    - 주석을 보고 코드 이해가 잘 되었는지 확인
        - 잘 작성되었다고 생각되는 부분을 근거로 첨부합니다.

<img width="907" alt="스크린샷 2024-01-29 오후 5 55 46" src="https://github.com/thetjswo/AIFFEL_MAIN_QUEST_kyh/assets/74177040/8ffa2456-e2ab-4f7a-b7db-4e8187d8fa9b">  
[리뷰] 익숙해지기 어려운 이미지 조건에 대한 설명을 상세하게 작성하였다.  

---
        
- [X]  **3. 에러가 난 부분을 디버깅하여 문제를 “해결한 기록을 남겼거나” 
”새로운 시도 또는 추가 실험을 수행”해봤나요?**
    - 문제 원인 및 해결 과정을 잘 기록하였는지 확인 또는
    - 문제에서 요구하는 조건에 더해 추가적으로 수행한 나만의 시도, 
    실험이 기록되어 있는지 확인
        - 잘 작성되었다고 생각되는 부분을 근거로 첨부합니다.
     
<img width="918" alt="스크린샷 2024-01-29 오후 5 56 32" src="https://github.com/thetjswo/AIFFEL_MAIN_QUEST_kyh/assets/74177040/7b659d81-d2ec-4d47-b645-8c0b5e4f08d5">  
[리뷰] 에러가 발생한 원인과 그에 대한 해결방안을 기록하였다.  

---
        
- [X]  **4. 회고를 잘 작성했나요?**
    - 주어진 문제를 해결하는 완성된 코드 내지 프로젝트 결과물에 대해
    배운점과 아쉬운점, 느낀점 등이 상세히 기록되어 있는지 확인
        - 딥러닝 모델의 경우,
        인풋이 들어가 최종적으로 아웃풋이 나오기까지의 전체 흐름을 도식화하여 
        모델 아키텍쳐에 대한 이해를 돕고 있는지 확인

<img width="881" alt="스크린샷 2024-01-29 오후 5 56 46" src="https://github.com/thetjswo/AIFFEL_MAIN_QUEST_kyh/assets/74177040/4dcf1d11-3f7c-4d8d-a3f6-e6967d209475">  
[리뷰] 프로젝트를 진행한 후의 느낌을 회고로 작성하였다.  

---

- [ ]  **5. 코드가 간결하고 효율적인가요?**
    - 파이썬 스타일 가이드 (PEP8) 를 준수하였는지 확인
    - 코드 중복을 최소화하고 범용적으로 사용할 수 있도록 모듈화(함수화) 했는지
        - 잘 작성되었다고 생각되는 부분을 근거로 첨부합니다.
