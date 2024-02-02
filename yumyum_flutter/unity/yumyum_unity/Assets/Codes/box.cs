using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class box : MonoBehaviour
{
    public GameObject openBox;
    public GameObject cards;
    // Start is called before the first frame update
    void Start()
    {
        // 1초 후에 OpenBox 함수를 호출
        Invoke("OpenBox", 1.5f);
    }

    // Update is called once per frame
    void Update()
    {

    }

    // 오픈 박스를 생성하는 함수
    void OpenBox()
    {
        // Instantiate를 사용하여 openBox 게임 오브젝트를 생성
        Instantiate(openBox, transform.position, Quaternion.identity);
        cards.SetActive(true);
        Destroy(this.gameObject);
    }
}
