using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class gaugeadd : MonoBehaviour
{
    public RectTransform rectTransform;
    public float startWidth = 100f; // 시작 가로 크기
    public float targetWidth = 200f; // 목표 가로 크기
    public float lerpSpeed = 0.5f; // Lerp 속도

    // Start is called before the first frame update
    void Start()
    {
        if (rectTransform == null)
        {
            // 이 스크립트가 부착된 객체의 RectTransform을 가져옴
            rectTransform = GetComponent<RectTransform>();
        }
    }

    // Update is called once per frame
    void Update()
    {
        // Lerp 함수를 사용하여 현재 가로 크기를 목표 가로 크기로 부드럽게 변화시킴
        float currentWidth = Mathf.Lerp(rectTransform.sizeDelta.x, targetWidth, lerpSpeed * Time.deltaTime);
        rectTransform.sizeDelta = new Vector2(currentWidth, rectTransform.sizeDelta.y);
    }
}
